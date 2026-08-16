	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AA08
sub_0803AA08: @ 0x0803AA08
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0803AA68 @ =gUnknown_0849E240
	bl sub_08015BD0
	adds r5, r0, #0
	lsls r5, r5, #0x18
	asrs r5, r5, #8
	lsrs r5, r5, #0x10
	ldr r6, _0803AA6C @ =gUnknown_03004100
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08025BE0
	ldr r0, _0803AA70 @ =gUnknown_0849D89C
	mov r8, r0
	ldr r0, [r0]
	str r6, [r0, #4]
	ldrb r0, [r0]
	ldr r1, _0803AA74 @ =gUnknown_03001470
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #5
	adds r1, #0x18
	adds r4, r4, r1
	ldr r1, [r4]
	bl sub_0803A190
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0]
	ldr r1, [r4]
	bl sub_0803A2BC
	movs r0, #0
	bl sub_08013AD4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803AA68: .4byte gUnknown_0849E240
_0803AA6C: .4byte gUnknown_03004100
_0803AA70: .4byte gUnknown_0849D89C
_0803AA74: .4byte gUnknown_03001470

