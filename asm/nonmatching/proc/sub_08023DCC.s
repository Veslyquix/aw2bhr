	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023DCC
sub_08023DCC: @ 0x08023DCC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08023A4C
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08023D48
	ldr r0, _08023E10 @ =gUnknown_03000559
	ldrb r0, [r0]
	cmp r0, #1
	bne _08023E0A
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_08023DA4
_08023E0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023E10: .4byte gUnknown_03000559

