	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080466DC
sub_080466DC: @ 0x080466DC
	push {r4, r5, lr}
	bl sub_080466A4
	ldr r0, _08046728 @ =gUnknown_0812A10C
	ldr r4, [r0]
	ldr r1, [r4]
	adds r1, #0x50
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08046738
	ldr r4, _0804672C @ =gpKeySt
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804674C
	bl sub_08014878
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _08046730 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804675C
	ldr r1, _08046734 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
	b _0804675C
	.align 2, 0
_08046728: .4byte gUnknown_0812A10C
_0804672C: .4byte gpKeySt
_08046730: .4byte gUnknown_03001FBC
_08046734: .4byte gUnknown_03002F1C
_08046738:
	bl sub_08046030
	bl sub_08013AEC
	bl sub_08013B0C
	ldr r0, [r4]
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
_0804674C:
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804675C
	bl sub_08045FC8
_0804675C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

