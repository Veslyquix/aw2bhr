	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080114A0
sub_080114A0: @ 0x080114A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r3, _080114E4 @ =gUnknown_03002F3C
	adds r1, r6, #0
	adds r1, #0x64
	ldrh r0, [r3]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	ldr r1, _080114E8 @ =0x013F0000
	cmp r0, r1
	ble _080114C6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r3]
_080114C6:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bgt _080114F0
	ldr r4, _080114EC @ =gUnknown_0808DF94
	ldr r5, [r4]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	movs r0, #0
	b _08011502
	.align 2, 0
_080114E4: .4byte gUnknown_03002F3C
_080114E8: .4byte 0x013F0000
_080114EC: .4byte gUnknown_0808DF94
_080114F0:
	ldr r4, _08011534 @ =gUnknown_0808DF94
	ldr r5, [r4]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	movs r0, #1
_08011502:
	movs r2, #0
	bl Interpolate
	strh r0, [r5]
	ldr r4, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0801152A
	movs r0, #0
	strh r0, [r4]
	ldr r2, _08011538 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r6, #0
	bl Proc_Break
_0801152A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011534: .4byte gUnknown_0808DF94
_08011538: .4byte gDispIo

