	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080133B8
sub_080133B8: @ 0x080133B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x4c]
	ldr r0, [r4, #0x54]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080133EA
	movs r0, #0
	str r0, [r4, #0x54]
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080133EA
	adds r0, r4, #0
	bl Proc_Break
	b _08013418
_080133EA:
	ldr r3, _08013420 @ =gUnknown_030030D0
	ldr r2, [r4, #0x54]
	lsls r0, r2, #2
	adds r0, r0, r5
	ldrh r1, [r0]
	strh r1, [r3]
	ldr r1, _08013424 @ =gUnknown_03002B20
	ldrh r0, [r0, #2]
	strh r0, [r1]
	adds r2, #1
	str r2, [r4, #0x54]
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08013418
	adds r0, r4, #0
	bl Proc_Break
_08013418:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013420: .4byte gUnknown_030030D0
_08013424: .4byte gUnknown_03002B20

