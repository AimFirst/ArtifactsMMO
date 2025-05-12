# artifacts_api.model.CharacterSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the character. | 
**account** | **String** | Account name. | 
**skin** | [**CharacterSkin**](CharacterSkin.md) | Character skin code. | 
**level** | **int** | Combat level. | 
**xp** | **int** | The current xp level of the combat level. | 
**maxXp** | **int** | XP required to level up the character. | 
**gold** | **int** | The numbers of gold on this character. | 
**speed** | **int** | *Not available, on the roadmap. Character movement speed. | 
**miningLevel** | **int** | Mining level. | 
**miningXp** | **int** | The current xp level of the Mining skill. | 
**miningMaxXp** | **int** | Mining XP required to level up the skill. | 
**woodcuttingLevel** | **int** | Woodcutting level. | 
**woodcuttingXp** | **int** | The current xp level of the Woodcutting skill. | 
**woodcuttingMaxXp** | **int** | Woodcutting XP required to level up the skill. | 
**fishingLevel** | **int** | Fishing level. | 
**fishingXp** | **int** | The current xp level of the Fishing skill. | 
**fishingMaxXp** | **int** | Fishing XP required to level up the skill. | 
**weaponcraftingLevel** | **int** | Weaponcrafting level. | 
**weaponcraftingXp** | **int** | The current xp level of the Weaponcrafting skill. | 
**weaponcraftingMaxXp** | **int** | Weaponcrafting XP required to level up the skill. | 
**gearcraftingLevel** | **int** | Gearcrafting level. | 
**gearcraftingXp** | **int** | The current xp level of the Gearcrafting skill. | 
**gearcraftingMaxXp** | **int** | Gearcrafting XP required to level up the skill. | 
**jewelrycraftingLevel** | **int** | Jewelrycrafting level. | 
**jewelrycraftingXp** | **int** | The current xp level of the Jewelrycrafting skill. | 
**jewelrycraftingMaxXp** | **int** | Jewelrycrafting XP required to level up the skill. | 
**cookingLevel** | **int** | The current xp level of the Cooking skill. | 
**cookingXp** | **int** | Cooking XP. | 
**cookingMaxXp** | **int** | Cooking XP required to level up the skill. | 
**alchemyLevel** | **int** | Alchemy level. | 
**alchemyXp** | **int** | Alchemy XP. | 
**alchemyMaxXp** | **int** | Alchemy XP required to level up the skill. | 
**hp** | **int** | Character actual HP. | 
**maxHp** | **int** | Character max HP. | 
**haste** | **int** | *Increase speed attack (reduce fight cooldown) | 
**criticalStrike** | **int** | % Critical strike. Critical strikes adds 50% extra damage to an attack (1.5x). | 
**wisdom** | **int** | Wisdom increases the amount of XP gained from fights (1% extra per 10 wisdom). | 
**prospecting** | **int** | Prospecting increases the chances of getting better loot (1% extra per 10 PP). | 
**attackFire** | **int** | Fire attack. | 
**attackEarth** | **int** | Earth attack. | 
**attackWater** | **int** | Water attack. | 
**attackAir** | **int** | Air attack. | 
**dmg** | **int** | % Damage. Damage increases your attack in all elements. | 
**dmgFire** | **int** | % Fire damage. Damage increases your fire attack. | 
**dmgEarth** | **int** | % Earth damage. Damage increases your earth attack. | 
**dmgWater** | **int** | % Water damage. Damage increases your water attack. | 
**dmgAir** | **int** | % Air damage. Damage increases your air attack. | 
**resFire** | **int** | % Fire resistance. Reduces fire attack. | 
**resEarth** | **int** | % Earth resistance. Reduces earth attack. | 
**resWater** | **int** | % Water resistance. Reduces water attack. | 
**resAir** | **int** | % Air resistance. Reduces air attack. | 
**x** | **int** | Character x coordinate. | 
**y** | **int** | Character y coordinate. | 
**cooldown** | **int** | Cooldown in seconds. | 
**weaponSlot** | **String** | Weapon slot. | 
**runeSlot** | **String** | Rune slot. | 
**shieldSlot** | **String** | Shield slot. | 
**helmetSlot** | **String** | Helmet slot. | 
**bodyArmorSlot** | **String** | Body armor slot. | 
**legArmorSlot** | **String** | Leg armor slot. | 
**bootsSlot** | **String** | Boots slot. | 
**ring1Slot** | **String** | Ring 1 slot. | 
**ring2Slot** | **String** | Ring 2 slot. | 
**amuletSlot** | **String** | Amulet slot. | 
**artifact1Slot** | **String** | Artifact 1 slot. | 
**artifact2Slot** | **String** | Artifact 2 slot. | 
**artifact3Slot** | **String** | Artifact 3 slot. | 
**utility1Slot** | **String** | Utility 1 slot. | 
**utility1SlotQuantity** | **int** | Utility 1 quantity. | 
**utility2Slot** | **String** | Utility 2 slot. | 
**utility2SlotQuantity** | **int** | Utility 2 quantity. | 
**bagSlot** | **String** | Bag slot. | 
**task** | **String** | Task in progress. | 
**taskType** | **String** | Task type. | 
**taskProgress** | **int** | Task progression. | 
**taskTotal** | **int** | Task total objective. | 
**inventoryMaxItems** | **int** | Inventory max items. | 
**cooldownExpiration** | [**DateTime**](DateTime.md) | Datetime Cooldown expiration. | [optional] 
**inventory** | [**BuiltList&lt;InventorySlot&gt;**](InventorySlot.md) | List of inventory slots. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


