# Battle calculation records

The user-provided `XenesisDocs/AW2 Datasheet.txt` identifies `0x030013D0` as the attacker record and `0x030013B0` as the defender record. Both have the same layout, represented in C by `struct BattleUnit` in `include/unknown-globals.h`.

| Offset | Attacker address | Defender address | C field | Meaning |
| --- | --- | --- | --- | --- |
| `+0x00` | `0x030013D0` | `0x030013B0` | `unit` | Pointer to the unit record |
| `+0x04` | `0x030013D4` | `0x030013B4` | `terrainId` | Terrain under the unit |
| `+0x06` | `0x030013D6` | `0x030013B6` | `terrainDefense` | Terrain defence bonus, later adjusted for HP |
| `+0x08` | `0x030013D8` | `0x030013B8` | `remainingHp` | Unit HP after the projected attack |
| `+0x0A` | `0x030013DA` | `0x030013BA` | `ammo` | Remaining primary-weapon ammunition |
| `+0x0C` | `0x030013DC` | `0x030013BC` | `damage` | Damage after firepower and luck calculations |
| `+0x0E` | `0x030013DE` | `0x030013BE` | `totalDefense` | Combined defence used by the formula |
| `+0x10` | `0x030013E0` | `0x030013C0` | `baseDamage` | Weapon damage selected before final modifiers |
| `+0x12` | `0x030013E2` | `0x030013C2` | `hpLoss` | Projected HP lost |
| `+0x14` | `0x030013E4` | `0x030013C4` | `displayDamage` | Damage value used by UI/forecast paths |
| `+0x16` | `0x030013E6` | `0x030013C6` | `filler_16` | Meaning not established |
| `+0x18` | `0x030013E8` | `0x030013C8` | `attackType` | Attack/weapon choice (1 or 5), also indexes presentation data |

`gBattleAttacker` and `gBattleDefender` are typed C aliases. They expand to the original linker symbols `gUnknown_030013D0` and `gUnknown_030013B0`, which remain at those addresses because the immutable assembly still references them. The record extent beyond `+0x19` is not established; `gUnknown_030013EC` is separately defined at attacker `+0x1C`.

Field names follow the Xenesis descriptions where available and the byte-matched C uses where those descriptions are incomplete. In particular, `ammo` is corroborated by writes to the unit's four-bit ammunition field, while `attackType` is an inferred name for the value used to select attack presentation data.
