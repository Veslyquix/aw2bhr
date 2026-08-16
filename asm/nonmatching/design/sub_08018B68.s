	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018B68
sub_08018B68: @ 0x08018B68
	push {r4, lr}
	ldr r2, _08018BA4 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r4, r1, r2
	ldr r1, [r4]
	ldr r2, [r1, #4]
	ldr r0, _08018BA8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #0xc]
	ldr r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08018B9A
	bl _call_via_r2
	bl sub_08017E74
	ldr r0, [r4]
	adds r0, #0x10
	str r0, [r4]
_08018B9A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08018BA4: .4byte gUnknown_0200C528
_08018BA8: .4byte gpKeySt

