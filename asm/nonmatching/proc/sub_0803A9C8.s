	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A9C8
sub_0803A9C8: @ 0x0803A9C8
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r4, _0803A9F8 @ =gUnknown_03004100
	adds r0, r4, #0
	bl sub_08025BE0
	ldr r0, _0803A9FC @ =gUnknown_0849E280
	movs r1, #0
	bl sub_080152EC
	ldr r2, _0803AA00 @ =gUnknown_0849D89C
	ldr r1, [r2]
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, [r2]
	str r4, [r1, #4]
	ldr r0, _0803AA04 @ =gUnknown_030033EC
	ldrh r0, [r0]
	strb r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A9F8: .4byte gUnknown_03004100
_0803A9FC: .4byte gUnknown_0849E280
_0803AA00: .4byte gUnknown_0849D89C
_0803AA04: .4byte gUnknown_030033EC

