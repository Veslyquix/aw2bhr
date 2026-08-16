	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017E0C
sub_08017E0C: @ 0x08017E0C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08017E40 @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	beq _08017E4C
	ldr r6, _08017E44 @ =gUnknown_03002EF0
	ldr r5, _08017E48 @ =gUnknown_0808E560
	ldr r3, [r5]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r3, #4
	adds r0, r1, r0
	ldr r2, [r0]
	ldrh r0, [r2, #8]
	strh r0, [r6]
	adds r1, r1, r3
	ldr r0, [r2, #0xc]
	strh r0, [r1, #0xc]
	movs r3, #0
	b _08017E52
	.align 2, 0
_08017E40: .4byte gUnknown_03002514
_08017E44: .4byte gUnknown_03002EF0
_08017E48: .4byte gUnknown_0808E560
_08017E4C:
	movs r3, #1
	ldr r5, _08017E70 @ =gUnknown_0808E560
	lsls r4, r4, #0x10
_08017E52:
	ldr r2, [r5]
	asrs r0, r4, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017E70: .4byte gUnknown_0808E560

