	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D558
sub_0802D558: @ 0x0802D558
	push {r4, lr}
	movs r4, #1
	ldr r0, _0802D594 @ =gUnknown_030033E4
	ldrh r1, [r0]
	ldr r0, _0802D598 @ =gUnknown_08499590
	ldr r0, [r0]
	movs r2, #4
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0802D56E
	adds r0, #0xf
_0802D56E:
	asrs r0, r0, #4
	subs r0, r1, r0
	cmp r0, #6
	bgt _0802D578
	movs r4, #0x14
_0802D578:
	bl sub_08024268
	ldr r0, _0802D59C @ =gUnknown_0849AE28
	adds r1, r4, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A104
	bl sub_08034F7C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D594: .4byte gUnknown_030033E4
_0802D598: .4byte gUnknown_08499590
_0802D59C: .4byte gUnknown_0849AE28

