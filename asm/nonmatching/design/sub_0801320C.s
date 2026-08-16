	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801320C
sub_0801320C: @ 0x0801320C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x64
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08013226
	adds r0, r5, #0
	bl Proc_Break
	b _08013268
_08013226:
	ldr r2, _08013270 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08013274 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08013278 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r4, _0801327C @ =gUnknown_03001FFC
	ldr r3, [r5, #0x54]
	adds r3, #1
	str r3, [r5, #0x54]
	movs r1, #0
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_08074234
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x54]
	cmp r0, r1
	bne _08013268
	adds r0, r5, #0
	bl Proc_Break
_08013268:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013270: .4byte gUnknown_030030E0
_08013274: .4byte gUnknown_03002020
_08013278: .4byte gUnknown_03002B28
_0801327C: .4byte gUnknown_03001FFC

