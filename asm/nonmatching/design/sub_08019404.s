	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019404
sub_08019404: @ 0x08019404
	push {r4, r5, r6, lr}
	ldr r4, _08019468 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r2, r0, #3
	adds r1, r2, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _08019462
	ldrh r0, [r1, #0xc]
	cmp r0, #0
	beq _0801942A
	subs r0, #1
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08019462
_0801942A:
	adds r0, r4, #0
	adds r0, #8
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _08019462
	ldr r0, [r1]
	cmp r0, #0
	beq _08019462
	adds r0, r4, #4
	adds r1, r2, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08019462
	ldr r6, _0801946C @ =gUnknown_0848A244
	adds r5, r3, #0
	adds r4, r1, #0
_0801944C:
	ldr r0, [r4]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0801944C
_08019462:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019468: .4byte gUnknown_0200C528
_0801946C: .4byte gUnknown_0848A244

