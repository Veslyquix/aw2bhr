	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BF2C
sub_0801BF2C: @ 0x0801BF2C
	push {r4, r5, lr}
	ldr r1, _0801BF70 @ =gUnknown_0200D510
	lsls r0, r0, #4
	adds r4, r0, r1
	cmp r4, #0
	beq _0801BF8A
_0801BF38:
	ldr r5, [r4, #0xc]
	cmp r5, #0
	beq _0801BF84
	ldrh r0, [r4, #4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801BF74
	ldrh r1, [r5]
	movs r0, #6
	ldrsh r2, [r4, r0]
	orrs r1, r2
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0801BF74
	movs r1, #4
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, #8]
	adds r1, r2, #0
	adds r2, r5, #0
	bl sub_0801C090
	b _0801BF84
	.align 2, 0
_0801BF70: .4byte gUnknown_0200D510
_0801BF74:
	movs r2, #4
	ldrsh r0, [r4, r2]
	movs r2, #6
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #8]
	adds r2, r5, #0
	bl sub_0801BD00
_0801BF84:
	ldr r4, [r4]
	cmp r4, #0
	bne _0801BF38
_0801BF8A:
	pop {r4, r5}
	pop {r0}
	bx r0

