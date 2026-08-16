	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019510
sub_08019510: @ 0x08019510
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08019558 @ =gpKeySt
	ldr r0, [r5]
	ldrh r1, [r0, #0xc]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0801954E
	bl sub_08014BE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801953E
	ldr r0, [r5]
	ldrh r1, [r0, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801953E
	ldr r1, _0801955C @ =gUnknown_03002514
	movs r0, #1
	strb r0, [r1]
_0801953E:
	ldr r0, [r4, #0x28]
	bl sub_080179D0
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	movs r0, #0
	str r0, [r4, #8]
_0801954E:
	bl sub_0803670C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019558: .4byte gpKeySt
_0801955C: .4byte gUnknown_03002514

