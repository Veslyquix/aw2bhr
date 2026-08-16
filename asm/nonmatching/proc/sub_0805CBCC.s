	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CBCC
sub_0805CBCC: @ 0x0805CBCC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0805CC64 @ =gUnknown_0816D9F0
	ldr r5, [r2]
	ldr r1, _0805CC68 @ =gUnknown_0816D9F4
	ldr r0, [r1]
	str r0, [r5]
	ldr r3, _0805CC6C @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r4, r0, #1
	adds r0, #0x40
	mov r8, r2
	mov sb, r1
	cmp r4, r0
	bge _0805CC34
	ldr r0, _0805CC70 @ =gUnknown_08499594
	mov ip, r0
	ldr r7, _0805CC74 @ =gUnknown_085D5ABC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r6, r3, #0
_0805CBFC:
	mov r1, ip
	ldr r0, [r1]
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0805CC28
	ldrb r1, [r3, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805CC28
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x1b]
	cmp r0, #4
	bne _0805CC28
	ldr r0, [r5]
	strb r4, [r0]
	adds r0, #1
	str r0, [r5]
_0805CC28:
	adds r2, #0xc
	adds r4, #1
	ldrh r0, [r6]
	adds r0, #0x40
	cmp r4, r0
	blt _0805CBFC
_0805CC34:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0805CC78 @ =gUnknown_0300477C
	ldr r0, [r0]
	bl sub_0805D344
	ldr r1, _0805CC7C @ =gUnknown_03004778
	ldr r0, _0805CC80 @ =sub_0805DB0C
	str r0, [r1]
	ldr r1, _0805CC84 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CC64: .4byte gUnknown_0816D9F0
_0805CC68: .4byte gUnknown_0816D9F4
_0805CC6C: .4byte gUnknown_03003F2C
_0805CC70: .4byte gUnknown_08499594
_0805CC74: .4byte gUnknown_085D5ABC
_0805CC78: .4byte gUnknown_0300477C
_0805CC7C: .4byte gUnknown_03004778
_0805CC80: .4byte sub_0805DB0C
_0805CC84: .4byte gUnknown_03004780

