	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C958
sub_0800C958: @ 0x0800C958
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_0800C6E8
	cmp r0, #0
	bne _0800C970
	movs r0, #1
	rsbs r0, r0, #0
	b _0800C9E0
_0800C970:
	movs r5, #0
	cmp r4, #0x48
	beq _0800C99E
	cmp r4, #0x48
	bgt _0800C980
	cmp r4, #0x28
	beq _0800C98A
	b _0800C9DE
_0800C980:
	cmp r4, #0x68
	beq _0800C9B2
	cmp r4, #0x88
	beq _0800C9C6
	b _0800C9DE
_0800C98A:
	movs r0, #0x2e
	bl sub_0800C8A0
	adds r5, r0, #0
	movs r0, #0x2a
	bl sub_0800C8A0
	adds r5, r5, r0
	movs r0, #0x2b
	b _0800C9D8
_0800C99E:
	movs r0, #0x4e
	bl sub_0800C8A0
	adds r5, r0, #0
	movs r0, #0x4a
	bl sub_0800C8A0
	adds r5, r5, r0
	movs r0, #0x4b
	b _0800C9D8
_0800C9B2:
	movs r0, #0x6e
	bl sub_0800C8A0
	adds r5, r0, #0
	movs r0, #0x6a
	bl sub_0800C8A0
	adds r5, r5, r0
	movs r0, #0x6b
	b _0800C9D8
_0800C9C6:
	movs r0, #0x8e
	bl sub_0800C8A0
	adds r5, r0, #0
	movs r0, #0x8a
	bl sub_0800C8A0
	adds r5, r5, r0
	movs r0, #0x8b
_0800C9D8:
	bl sub_0800C8A0
	adds r5, r5, r0
_0800C9DE:
	adds r0, r5, #0
_0800C9E0:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

