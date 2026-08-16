	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B51C
sub_0807B51C: @ 0x0807B51C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	cmp r4, #0
	beq _0807B562
	ldr r1, _0807B56C @ =gUnknown_0861617C
	lsls r0, r3, #2
	adds r6, r0, r1
_0807B530:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	ldr r1, [r6]
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	str r1, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _0807B570 @ =gUnknown_0848B690
	bl sub_0801BEBC
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #0xc
	cmp r4, #0
	bne _0807B530
_0807B562:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B56C: .4byte gUnknown_0861617C
_0807B570: .4byte gUnknown_0848B690

