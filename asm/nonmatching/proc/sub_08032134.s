	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032134
sub_08032134: @ 0x08032134
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _080321A0 @ =gUnknown_0849B018
	ldr r1, [r3]
	ldrh r0, [r1, #4]
	cmp r0, #7
	bne _08032198
	ldrb r0, [r1, #1]
	movs r0, #0
	strb r0, [r1, #1]
	ldr r1, [r3]
	ldrh r2, [r1, #4]
	movs r2, #0
	strh r0, [r1, #4]
	ldrb r0, [r1, #6]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r3]
	ldrb r1, [r0, #7]
	strb r2, [r0, #7]
	ldr r0, [r3]
	ldrb r1, [r0, #8]
	strb r2, [r0, #8]
	ldr r0, [r3]
	ldrb r1, [r0, #9]
	strb r2, [r0, #9]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1c]
	strb r2, [r0, #0x1c]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1d]
	strb r2, [r0, #0x1d]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1e]
	strb r2, [r0, #0x1e]
	bl sub_0802F23C
	bl sub_0802F03C
	bl sub_0802F28C
	ldr r1, _080321A4 @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08032198:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080321A0: .4byte gUnknown_0849B018
_080321A4: .4byte 0x04000134

