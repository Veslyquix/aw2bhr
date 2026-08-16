	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805BF3C
sub_0805BF3C: @ 0x0805BF3C
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r0, sp
	movs r1, #0
	movs r2, #0x19
	bl sub_0808B6C4
	mov r0, sp
	adds r0, #1
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #5
	strb r1, [r0]
	mov r1, sp
	adds r1, #9
	movs r0, #9
	strb r0, [r1]
	ldr r2, _0805BFA8 @ =gUnknown_08499594
	ldr r0, _0805BFAC @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r2, _0805BFB0 @ =gUnknown_030046D4
	ldrb r0, [r1]
	str r0, [r2]
	ldrb r0, [r3, #0xb]
	cmp r0, #7
	bls _0805BF8A
	movs r0, #1
	strb r0, [r3, #0xb]
_0805BF8A:
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0805BFB8
	ldr r0, _0805BFB4 @ =gUnknown_085768B8
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	b _0805BFD0
	.align 2, 0
_0805BFA8: .4byte gUnknown_08499594
_0805BFAC: .4byte gUnknown_030040D8
_0805BFB0: .4byte gUnknown_030046D4
_0805BFB4: .4byte gUnknown_085768B8
_0805BFB8:
	ldr r1, _0805BFD8 @ =gUnknown_085768B8
	ldr r0, [r2]
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
_0805BFD0:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BFD8: .4byte gUnknown_085768B8

