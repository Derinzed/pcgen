package pcgen.core.analysis;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

import pcgen.cdom.enumeration.FormulaKey;
import pcgen.cdom.enumeration.IntegerKey;
import pcgen.cdom.enumeration.ObjectKey;
import pcgen.cdom.enumeration.StringKey;
import pcgen.core.Equipment;
import pcgen.core.EquipmentModifier;
import pcgen.core.Globals;
import pcgen.core.PCClass;
import pcgen.core.PlayerCharacter;
import pcgen.core.bonus.BonusObj;
import pcgen.core.prereq.Prerequisite;
import pcgen.core.spell.Spell;
import pcgen.util.Delta;

public class EqModCost
{
	private static final String s_CHARGES = "CHARGES";

	public static BigDecimal addItemCosts(EquipmentModifier eqMod,
			final PlayerCharacter aPC, final String bonusType, final int qty,
			final Equipment parent)
	{
		double val = 0;

		Set<String> typesToGetBonusesFor = new HashSet<String>();

		for (BonusObj bonus : eqMod.getBonusList(parent))
		{
			boolean meetsAll = true;

			if (bonus.getBonusName().equals(bonusType))
			{
				StringTokenizer aTok = new StringTokenizer(bonus.toString()
						.substring(bonusType.length()), "|", false);
				final String bType = aTok.nextToken();
				aTok = new StringTokenizer(bType.substring(5), ".", false);

				String typeString = "TYPE";

				while (aTok.hasMoreTokens())
				{
					final String sub_type = aTok.nextToken();
					meetsAll = parent.isType(sub_type);

					if (!meetsAll)
					{
						break;
					}

					typeString += "." + sub_type;
				}

				if (meetsAll)
				{
					typesToGetBonusesFor.add(typeString);
				}
			}
		}

		for (String typeString : typesToGetBonusesFor)
		{
			val += eqMod.bonusTo(aPC, bonusType, typeString, parent);
		}

		return new BigDecimal(val * qty);
	}

	public static boolean getCostDouble(EquipmentModifier eqMod)
	{
		//
		// Uninitialized?
		//
		Boolean costdouble = eqMod.get(ObjectKey.COST_DOUBLE);
		if (costdouble == null)
		{
			if (eqMod.isType("MagicalEnhancement")
					|| eqMod.isType("BaseMaterial"))
			{
				return false;
			}

			if (eqMod.isIType("MAGIC"))
			{
				return true;
			}

			for (Prerequisite preReq : eqMod.getPrerequisiteList())
			{
				if ("TYPE".equalsIgnoreCase(preReq.getKind())
						&& ((preReq.getKey()
								.equalsIgnoreCase("EQMODTYPE=MagicalEnhancement")) || (preReq
								.getKey()
								.equalsIgnoreCase("EQMODTYPE.MagicalEnhancement"))))
				{
					return true;
				}
			}
			return false;
		}

		return costdouble;
	}

	public static String getCost(EquipmentModifier eqMod, final String listEntry)
	{
		String costFormula = eqMod.getSafe(FormulaKey.COST).toString();
		String modChoice = "";

		while (costFormula.indexOf("%SPELLLEVEL") >= 0)
		{
			final int idx = costFormula.indexOf("%SPELLLEVEL");

			if (modChoice.length() == 0)
			{
				final int iLevel = EqModSpellInfo.getSpellInfo(listEntry,
						"SPELLLEVEL");

				if (iLevel == 0)
				{
					modChoice = "0.5";
				}
				else
				{
					modChoice = Integer.toString(iLevel);
				}
			}

			costFormula = costFormula.substring(0, idx) + modChoice
					+ costFormula.substring(idx + 11);
		}

		costFormula = replaceCostSpellCost(costFormula, listEntry);
		costFormula = replaceCostSpellXPCost(costFormula, listEntry);
		costFormula = replaceCostCasterLevel(costFormula, listEntry);
		costFormula = replaceCostCharges(costFormula, listEntry);
		costFormula = replaceCostChoice(costFormula, listEntry);

		return costFormula;
	}

	private static String replaceCostCasterLevel(String costFormula,
			final String listEntry)
	{
		String modChoice = "";

		while (costFormula.indexOf("%CASTERLEVEL") >= 0)
		{
			final int idx = costFormula.indexOf("%CASTERLEVEL");

			if (modChoice.length() == 0)
			{
				final int iCasterLevel = EqModSpellInfo.getSpellInfo(
						listEntry, "CASTERLEVEL");
				modChoice = Integer.toString(iCasterLevel);

				//
				// Tack on the item creation multiplier, if there is one
				//
				final String castClassKey = EqModSpellInfo
						.getSpellInfoString(listEntry, "CASTER");

				if (castClassKey.length() != 0)
				{
					final PCClass castClass = Globals.getContext().ref
							.silentlyGetConstructedCDOMObject(PCClass.class,
									castClassKey);

					if (castClass != null)
					{
						final StringBuffer multiple = new StringBuffer(200);
						String aString = castClass.get(StringKey.ITEMCREATE);

						if (aString != null && aString.length() != 0)
						{
							final StringTokenizer aTok = new StringTokenizer(
									aString, "+-*/()", true);

							//
							// This is to support older versions of the
							// ITEMCREATE tag
							// that allowed 0.5, because it used to be just a
							// multiple
							//
							if (aTok.countTokens() == 1)
							{
								multiple.append(iCasterLevel).append('*')
										.append(aString);
							}
							else
							{
								while (aTok.hasMoreTokens())
								{
									aString = aTok.nextToken();

									if (aString.equals("CL"))
									{
										multiple.append(iCasterLevel);
									}
									else
									{
										multiple.append(aString);
									}
								}
							}

							modChoice = multiple.toString();
						}
					}
				}
			}

			costFormula = costFormula.substring(0, idx) + "(" + modChoice + ")"
					+ costFormula.substring(idx + 12);
		}

		return costFormula;
	}

	private static String replaceCostCharges(String costFormula,
			final String listEntry)
	{
		String modChoice = "";

		while (costFormula.indexOf("%" + s_CHARGES) >= 0)
		{
			final int idx = costFormula.indexOf("%" + s_CHARGES);

			if (modChoice.length() == 0)
			{
				modChoice = Integer.toString(EqModSpellInfo.getSpellInfo(
						listEntry, s_CHARGES));
			}

			costFormula = costFormula.substring(0, idx) + modChoice
					+ costFormula.substring(idx + 8);
		}

		return costFormula;
	}

	private static String replaceCostSpellCost(String costFormula,
			final String listEntry)
	{
		String modChoice = "";

		while (costFormula.indexOf("%SPELLCOST") >= 0)
		{
			final int idx = costFormula.indexOf("%SPELLCOST");

			if (modChoice.length() == 0)
			{
				final String spellName = EqModSpellInfo.getSpellInfoString(
						listEntry, "SPELLNAME");
				final Spell aSpell = Globals.getSpellKeyed(spellName);

				if (aSpell != null)
				{
					modChoice = aSpell.getSafe(ObjectKey.COST).toString();
				}
			}

			costFormula = costFormula.substring(0, idx) + modChoice
					+ costFormula.substring(idx + 10);
		}

		return costFormula;
	}

	private static String replaceCostChoice(String costFormula,
			final String listEntry)
	{
		String modChoice = "";

		while (costFormula.indexOf("%CHOICE") >= 0)
		{
			final int idx = costFormula.indexOf("%CHOICE");

			if (modChoice.length() == 0)
			{
				final int offs = listEntry.lastIndexOf('|');
				int modValue = 0;

				try
				{
					modValue = Delta.parseInt(listEntry.substring(offs + 1));
				}
				catch (NumberFormatException exc)
				{
					// TODO: Should this really be ignored?
				}

				modChoice = Integer.toString(modValue);
			}

			costFormula = costFormula.substring(0, idx) + modChoice
					+ costFormula.substring(idx + 7);
		}

		return costFormula;
	}

	private static String replaceCostSpellXPCost(String costFormula,
			final String listEntry)
	{
		String modChoice = "";

		while (costFormula.indexOf("%SPELLXPCOST") >= 0)
		{
			final int idx = costFormula.indexOf("%SPELLXPCOST");

			if (modChoice.length() == 0)
			{
				final String spellName = EqModSpellInfo.getSpellInfoString(
						listEntry, "SPELLNAME");
				final Spell aSpell = Globals.getSpellKeyed(spellName);

				if (aSpell != null)
				{
					modChoice = Integer.toString(aSpell
							.getSafe(IntegerKey.XP_COST));
				}
			}

			costFormula = costFormula.substring(0, idx) + modChoice
					+ costFormula.substring(idx + 12);
		}

		return costFormula;
	}

}
