	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034230
sub_08034230: @ 0x08034230
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0803BD6C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08034288
	ldr r0, _08034278 @ =gUnknown_0849BB80
	bl Proc_Find
	cmp r0, #0
	beq _08034280
	ldr r0, _0803427C @ =gUnknown_0849BC50
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x4c]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x48]
	str r1, [r0, #0x44]
	str r1, [r0, #0x40]
	adds r2, r0, #0
	adds r2, #0x36
	movs r1, #1
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _08034288
	.align 2, 0
_08034278: .4byte gUnknown_0849BB80
_0803427C: .4byte gUnknown_0849BC50
_08034280:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08034288:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

