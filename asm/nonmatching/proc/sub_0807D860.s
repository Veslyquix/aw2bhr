	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807D860
sub_0807D860: @ 0x0807D860
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #9
	bne _0807D894
	ldr r4, _0807D904 @ =gUnknown_030058E0
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807D908 @ =gUnknown_03005948
	ldr r1, [r6, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	movs r1, #0x40
	movs r2, #1
	bl sub_08043BA4
_0807D894:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x10
	bne _0807D8FC
	ldr r5, _0807D904 @ =gUnknown_030058E0
	adds r7, r6, #0
	adds r7, #0x52
	ldrh r0, [r7]
	ldr r4, _0807D908 @ =gUnknown_03005948
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807D90C @ =0x06013000
	movs r2, #0x12
	bl sub_08043E3C
	ldrh r0, [r7]
	adds r0, #1
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807D910 @ =0x06013480
	movs r2, #0x13
	bl sub_08043E3C
	ldrh r0, [r7]
	adds r0, #2
	ldr r1, [r6, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r6, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807D914 @ =0x06013900
	movs r2, #0x14
	bl sub_08043E3C
_0807D8FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D904: .4byte gUnknown_030058E0
_0807D908: .4byte gUnknown_03005948
_0807D90C: .4byte 0x06013000
_0807D910: .4byte 0x06013480
_0807D914: .4byte 0x06013900

