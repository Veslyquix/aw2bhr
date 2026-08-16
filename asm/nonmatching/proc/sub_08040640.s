	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040640
sub_08040640: @ 0x08040640
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	subs r1, #2
	adds r5, r4, #0
	adds r5, #0x44
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	subs r0, #1
	ldr r1, [r4, #0x30]
	subs r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	subs r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	adds r0, #1
	ldr r1, [r4, #0x30]
	subs r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	subs r0, #2
	ldr r1, [r4, #0x30]
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	subs r0, #1
	ldr r1, [r4, #0x30]
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	adds r0, #1
	ldr r1, [r4, #0x30]
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	adds r0, #2
	ldr r1, [r4, #0x30]
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	subs r0, #1
	ldr r1, [r4, #0x30]
	adds r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	adds r0, #1
	ldr r1, [r4, #0x30]
	adds r1, #1
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	movs r3, #0
	ldrsh r2, [r5, r3]
	bl sub_08026100
	bl sub_08024268
	ldr r0, _08040740 @ =gUnknown_08111D94
	ldr r1, _08040744 @ =gUnknown_08499590
	ldr r3, [r1]
	movs r1, #4
	ldrsh r2, [r3, r1]
	ldr r1, [r4, #0x54]
	subs r1, r1, r2
	movs r2, #6
	ldrsh r3, [r3, r2]
	ldr r2, [r4, #0x58]
	subs r2, r2, r3
	adds r4, #0x4a
	ldrh r3, [r4]
	movs r4, #3
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_0801C70C
	ldr r0, _08040748 @ =0x000001C7
	bl sub_0803B4DC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040740: .4byte gUnknown_08111D94
_08040744: .4byte gUnknown_08499590
_08040748: .4byte 0x000001C7

