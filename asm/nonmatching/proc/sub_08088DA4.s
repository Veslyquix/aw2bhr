	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08088DA4
sub_08088DA4: @ 0x08088DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08088E64 @ =gUnknown_030058E0
	mov r8, r0
	adds r7, r6, #0
	adds r7, #0x52
	ldrh r0, [r7]
	ldr r4, _08088E68 @ =gUnknown_03005948
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r5, [r0]
	ldrh r0, [r7]
	adds r0, #1
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	mov sb, r0
	ldrh r0, [r7]
	adds r0, #2
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	add r0, r8
	ldrb r7, [r0]
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	bne _08088E0E
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_08043BC8
_08088E0E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	bne _08088E26
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_08043BF8
	adds r0, r5, #0
	movs r1, #0x11
	bl sub_08043AA0
_08088E26:
	ldr r0, [r6, #0x60]
	cmp r0, #0
	bge _08088E78
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	bne _08088E3E
	ldr r1, _08088E6C @ =0x06013000
	adds r0, r5, #0
	movs r2, #0x12
	bl sub_08043E3C
_08088E3E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xe
	bne _08088E50
	ldr r1, _08088E70 @ =0x06013480
	mov r0, sb
	movs r2, #0x13
	bl sub_08043E3C
_08088E50:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	bne _08088EB2
	ldr r1, _08088E74 @ =0x06013900
	adds r0, r7, #0
	movs r2, #0x14
	bl sub_08043E3C
	b _08088EB2
	.align 2, 0
_08088E64: .4byte gUnknown_030058E0
_08088E68: .4byte gUnknown_03005948
_08088E6C: .4byte 0x06013000
_08088E70: .4byte 0x06013480
_08088E74: .4byte 0x06013900
_08088E78:
	cmp r0, #0
	ble _08088EB2
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xd
	bne _08088E8E
	ldr r1, _08088EC0 @ =0x06013000
	adds r0, r5, #0
	movs r2, #0x12
	bl sub_08043E3C
_08088E8E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bne _08088EA0
	ldr r1, _08088EC4 @ =0x06013480
	mov r0, sb
	movs r2, #0x13
	bl sub_08043E3C
_08088EA0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bne _08088EB2
	ldr r1, _08088EC8 @ =0x06013900
	adds r0, r7, #0
	movs r2, #0x14
	bl sub_08043E3C
_08088EB2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088EC0: .4byte 0x06013000
_08088EC4: .4byte 0x06013480
_08088EC8: .4byte 0x06013900

