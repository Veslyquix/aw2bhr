	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080442E4
sub_080442E4: @ 0x080442E4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, _08044318 @ =gUnknown_08091388
	ldr r7, [r2]
	ldr r1, [r7]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r5, r0, #2
	adds r1, r5, r1
	adds r1, #0x24
	ldrb r0, [r1]
	adds r6, r2, #0
	cmp r0, #1
	bhi _0804431C
	adds r0, r4, #0
	bl sub_08044280
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804431C
	ldr r0, [r7]
	adds r0, r5, r0
	adds r0, #0x24
	movs r1, #2
	b _08044344
	.align 2, 0
_08044318: .4byte gUnknown_08091388
_0804431C:
	ldr r6, [r6]
	ldr r0, [r6]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r5, r1, #2
	adds r0, r5, r0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804434A
	adds r0, r4, #0
	bl sub_080442AC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804434A
	ldr r0, [r6]
	adds r0, r5, r0
	adds r0, #0x24
	movs r1, #1
_08044344:
	strb r1, [r0]
	movs r0, #1
	b _0804434C
_0804434A:
	movs r0, #0
_0804434C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

