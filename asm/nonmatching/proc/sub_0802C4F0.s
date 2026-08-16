	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C4F0
sub_0802C4F0: @ 0x0802C4F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802C520 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0802C54A
	ldr r0, _0802C524 @ =gUnknown_03003F40
	ldr r0, [r0]
	cmp r0, #0
	bge _0802C528
	bl sub_08034F8C
	adds r0, r4, #0
	bl Proc_End
	bl sub_0802D558
	b _0802C54A
	.align 2, 0
_0802C520: .4byte gUnknown_0849A00C
_0802C524: .4byte gUnknown_03003F40
_0802C528:
	bl sub_080413A4
	adds r1, r0, #0
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _0802C53C
	ldrb r0, [r1]
	bl sub_080425E0
	b _0802C544
_0802C53C:
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	bl sub_08042618
_0802C544:
	adds r0, r4, #0
	bl Proc_Break
_0802C54A:
	pop {r4}
	pop {r0}
	bx r0

