	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045650
sub_08045650: @ 0x08045650
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r2, _08045690 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r1, [r0, #2]
	cmp r4, r1
	bge _080456AA
	ldrh r6, [r0]
	adds r5, r1, #0
	ldr r0, _08045694 @ =gUnknown_020288B4
	mov ip, r0
	mov r8, r2
_0804566C:
	movs r3, #0
	cmp r3, r6
	bge _080456A4
	mov r7, r8
	ldr r2, [r7]
	lsls r1, r4, #1
	ldr r7, _08045698 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r2, [r2]
	mov r7, ip
	adds r1, r0, r7
_08045686:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804569C
	movs r0, #1
	b _080456AC
	.align 2, 0
_08045690: .4byte gUnknown_08499590
_08045694: .4byte gUnknown_020288B4
_08045698: .4byte 0x0000417A
_0804569C:
	adds r1, #1
	adds r3, #1
	cmp r3, r2
	blt _08045686
_080456A4:
	adds r4, #1
	cmp r4, r5
	blt _0804566C
_080456AA:
	movs r0, #0
_080456AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

