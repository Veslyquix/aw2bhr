	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BB10
sub_0801BB10: @ 0x0801BB10
	adds r3, r1, #0
	cmp r0, #1
	beq _0801BB34
	cmp r0, #1
	bgt _0801BB20
	cmp r0, #0
	beq _0801BB26
	b _0801BB52
_0801BB20:
	cmp r0, #2
	beq _0801BB48
	b _0801BB52
_0801BB26:
	ldr r1, _0801BB30 @ =gUnknown_0808F088
	ldr r0, [r1]
	str r3, [r0]
	b _0801BB54
	.align 2, 0
_0801BB30: .4byte gUnknown_0808F088
_0801BB34:
	ldr r2, _0801BB44 @ =gUnknown_0808F088
	ldr r1, [r2]
	ldr r0, [r1]
	ands r0, r3
	str r0, [r1]
	adds r1, r2, #0
	b _0801BB54
	.align 2, 0
_0801BB44: .4byte gUnknown_0808F088
_0801BB48:
	ldr r2, _0801BB70 @ =gUnknown_0808F088
	ldr r1, [r2]
	ldr r0, [r1]
	orrs r0, r3
	str r0, [r1]
_0801BB52:
	ldr r1, _0801BB70 @ =gUnknown_0808F088
_0801BB54:
	ldr r0, _0801BB74 @ =0x04000200
	ldr r1, [r1]
	ldr r1, [r1]
	strh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #9
	ands r3, r1
	cmp r3, #0
	beq _0801BB7C
	ldr r1, _0801BB78 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	b _0801BB80
	.align 2, 0
_0801BB70: .4byte gUnknown_0808F088
_0801BB74: .4byte 0x04000200
_0801BB78: .4byte 0x04000208
_0801BB7C:
	ldr r0, _0801BB84 @ =0x04000208
	strh r3, [r0]
_0801BB80:
	bx lr
	.align 2, 0
_0801BB84: .4byte 0x04000208

