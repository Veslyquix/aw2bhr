	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08065EF4
sub_08065EF4: @ 0x08065EF4
	push {r4, r5, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _08065F60 @ =gUnknown_0816E120
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08065F64 @ =gUnknown_08580934
	ldr r2, [r0]
	adds r3, r2, #0
	adds r3, #0x32
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r2, #0x34
	adds r2, r2, r0
	ldr r5, [r2]
	ldrb r0, [r3]
	movs r1, #1
	ands r1, r0
	movs r4, #0x28
	ldrsh r0, [r5, r4]
	lsls r1, r1, #4
	mov r2, sp
	adds r4, r2, r1
	movs r3, #8
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	adds r1, #0x34
	bl sub_08064474
	movs r3, #0x28
	ldrsh r0, [r5, r3]
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	adds r1, #0x34
	bl sub_08064500
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065F60: .4byte gUnknown_0816E120
_08065F64: .4byte gUnknown_08580934

