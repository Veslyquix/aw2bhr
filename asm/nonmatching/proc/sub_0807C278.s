	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C278
sub_0807C278: @ 0x0807C278
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r5, #0
	adds r6, r0, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r5, r0
	bge _0807C2C0
	ldr r2, _0807C2CC @ =gUnknown_0202FF78
	mov r8, r2
	movs r7, #0x80
_0807C294:
	mov r1, r8
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r4, r6, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	add r0, r8
	ldrb r0, [r0]
	subs r1, r1, r0
	adds r1, #0xe0
	str r7, [sp]
	movs r0, #0
	movs r2, #0x18
	ldr r3, _0807C2D0 @ =gUnknown_0848B6E6
	bl PutSprite
	adds r7, #8
	adds r5, #1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _0807C294
_0807C2C0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C2CC: .4byte gUnknown_0202FF78
_0807C2D0: .4byte gUnknown_0848B6E6

