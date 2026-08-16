	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080132B0
sub_080132B0: @ 0x080132B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x68
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080132CA
	adds r0, r5, #0
	bl Proc_Break
	b _0801330C
_080132CA:
	ldr r2, _08013314 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08013318 @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0801331C @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r4, _08013320 @ =gUnknown_03001FFC
	ldr r3, [r5, #0x5c]
	adds r3, #1
	str r3, [r5, #0x5c]
	movs r1, #0
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x5c]
	cmp r0, r1
	bne _0801330C
	adds r0, r5, #0
	bl Proc_Break
_0801330C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013314: .4byte gUnknown_030030E0
_08013318: .4byte gUnknown_03002020
_0801331C: .4byte gUnknown_03002B28
_08013320: .4byte gUnknown_03001FFC

