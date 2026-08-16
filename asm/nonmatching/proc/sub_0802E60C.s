	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E60C
sub_0802E60C: @ 0x0802E60C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r0, #0x10
	asrs r0, r0, #0x10
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0802E724
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E62C
	movs r0, #0x68
	bl sub_0803B4DC
	b _0802E67E
_0802E62C:
	bl sub_08022A08
	ldr r5, _0802E684 @ =gUnknown_03003F24
	ldr r0, _0802E688 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	strh r0, [r5]
	ldrb r0, [r1, #3]
	strh r0, [r5, #2]
	ldr r4, _0802E68C @ =gUnknown_03003100
	strh r7, [r4]
	strh r6, [r4, #2]
	bl sub_08034F54
	ldr r6, _0802E690 @ =gUnknown_03003334
	movs r0, #3
	strh r0, [r6]
	ldr r1, [r5]
	ldr r0, [r4]
	cmp r1, r0
	beq _0802E67E
	bl sub_08038AD8
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r4, _0802E694 @ =gUnknown_03003110
	adds r2, r4, #0
	movs r3, #4
	bl sub_0802E7C8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802E678
	movs r0, #5
	strh r0, [r6]
_0802E678:
	adds r0, r4, #0
	bl sub_08025BB4
_0802E67E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E684: .4byte gUnknown_03003F24
_0802E688: .4byte gUnknown_030040D8
_0802E68C: .4byte gUnknown_03003100
_0802E690: .4byte gUnknown_03003334
_0802E694: .4byte gUnknown_03003110

