	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AA78
sub_0803AA78: @ 0x0803AA78
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0803AAB4 @ =gUnknown_0849E280
	bl sub_08015BD0
	ldr r5, _0803AAB8 @ =gUnknown_03004100
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08025BE0
	ldr r4, _0803AABC @ =gUnknown_0849D89C
	ldr r0, [r4]
	str r5, [r0, #4]
	ldrb r0, [r0]
	adds r1, r5, #0
	bl sub_0803A190
	ldr r1, [r4]
	ldrb r0, [r1]
	ldr r1, [r1, #4]
	bl sub_0803A2BC
	movs r0, #0
	bl sub_08013AD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803AAB4: .4byte gUnknown_0849E280
_0803AAB8: .4byte gUnknown_03004100
_0803AABC: .4byte gUnknown_0849D89C

