	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A304
sub_0802A304: @ 0x0802A304
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r5, #0
	movs r6, #0
	ldr r2, _0802A384 @ =gUnknown_085D5ABC
	ldrb r1, [r7]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0802A376
	ldr r0, _0802A388 @ =gUnknown_08499594
	mov r8, r0
	mov sb, r2
_0802A32C:
	adds r0, r7, #7
	adds r4, r0, r6
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802A360
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0
	bl sub_08029978
	adds r5, r5, r0
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0
	bl sub_08029A48
	adds r5, r5, r0
_0802A360:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrb r1, [r7]
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, sb
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r6, r0
	blo _0802A32C
_0802A376:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802A384: .4byte gUnknown_085D5ABC
_0802A388: .4byte gUnknown_08499594

