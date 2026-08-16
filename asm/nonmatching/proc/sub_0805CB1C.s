	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805CB1C
sub_0805CB1C: @ 0x0805CB1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0805CBAC @ =gUnknown_0816D9E8
	ldr r5, [r2]
	ldr r1, _0805CBB0 @ =gUnknown_0816D9EC
	ldr r0, [r1]
	str r0, [r5]
	ldr r3, _0805CBB4 @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r4, r0, #1
	adds r0, #0x40
	mov r8, r2
	mov sb, r1
	cmp r4, r0
	bge _0805CB84
	ldr r0, _0805CBB8 @ =gUnknown_08499594
	mov ip, r0
	ldr r7, _0805CBBC @ =gUnknown_085D5ABC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r6, r3, #0
_0805CB4C:
	mov r1, ip
	ldr r0, [r1]
	adds r3, r2, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0805CB78
	ldrb r1, [r3, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805CB78
	ldrb r1, [r3]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0805CB78
	ldr r0, [r5]
	strb r4, [r0]
	adds r0, #1
	str r0, [r5]
_0805CB78:
	adds r2, #0xc
	adds r4, #1
	ldrh r0, [r6]
	adds r0, #0x40
	cmp r4, r0
	blt _0805CB4C
_0805CB84:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2]
	movs r0, #0
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1]
	str r0, [r2]
	ldr r1, _0805CBC0 @ =gUnknown_03004778
	ldr r0, _0805CBC4 @ =sub_0805DA84
	str r0, [r1]
	ldr r1, _0805CBC8 @ =gUnknown_03004780
	movs r0, #2
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CBAC: .4byte gUnknown_0816D9E8
_0805CBB0: .4byte gUnknown_0816D9EC
_0805CBB4: .4byte gUnknown_03003F2C
_0805CBB8: .4byte gUnknown_08499594
_0805CBBC: .4byte gUnknown_085D5ABC
_0805CBC0: .4byte gUnknown_03004778
_0805CBC4: .4byte sub_0805DA84
_0805CBC8: .4byte gUnknown_03004780

