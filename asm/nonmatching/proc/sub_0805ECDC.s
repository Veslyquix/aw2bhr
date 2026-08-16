	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805ECDC
sub_0805ECDC: @ 0x0805ECDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _0805ED38 @ =gUnknown_085D5ABC
	mov r8, r0
	ldr r6, _0805ED3C @ =gUnknown_030040D8
	ldr r0, [r6]
	ldrb r1, [r0]
	movs r7, #0x5c
	adds r0, r1, #0
	muls r0, r7, r0
	add r0, r8
	ldrb r0, [r0, #0x1a]
	adds r5, r1, #0
	cmp r0, #0x20
	bne _0805ED00
	movs r5, #0x11
_0805ED00:
	add r0, sp, #4
	bl sub_08058F30
	ldr r4, _0805ED40 @ =gUnknown_030013EC
	ldr r1, [r6]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	add r2, sp, #4
	ldrb r3, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r4, [r4]
	adds r2, r5, #0
	bl _call_via_r4
	bl sub_08059AEC
	add r4, sp, #8
	adds r0, r4, #0
	bl sub_08058F90
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0805ED44
	bl sub_0805F4F8
	b _0805ED60
	.align 2, 0
_0805ED38: .4byte gUnknown_085D5ABC
_0805ED3C: .4byte gUnknown_030040D8
_0805ED40: .4byte gUnknown_030013EC
_0805ED44:
	ldr r0, [r6]
	ldrb r0, [r0]
	muls r0, r7, r0
	add r0, r8
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x20
	bne _0805ED5A
	adds r0, r4, #0
	bl sub_080590DC
	b _0805ED60
_0805ED5A:
	adds r0, r4, #0
	bl sub_080591E4
_0805ED60:
	bl sub_0805F7B8
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

