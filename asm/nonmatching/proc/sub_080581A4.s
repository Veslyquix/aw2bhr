	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080581A4
sub_080581A4: @ 0x080581A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xa0
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r3, #0
	ldr r1, _0805821C @ =gUnknown_0816D938
	ldr r0, [r1]
	ldr r0, [r0]
	adds r7, r1, #0
	ldrh r1, [r0, #2]
	cmp r3, r1
	bge _080581D6
	adds r1, r0, #0
	ldr r0, _08058220 @ =0x0000417A
	adds r2, r1, r0
	mov r4, sp
_080581C6:
	ldrh r0, [r2]
	adds r0, r5, r0
	stm r4!, {r0}
	adds r2, #2
	adds r3, #1
	ldrh r0, [r1, #2]
	cmp r3, r0
	blt _080581C6
_080581D6:
	movs r3, #0
	ldr r2, [r7]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _08058212
	adds r5, r2, #0
_080581E4:
	movs r2, #0
	ldr r0, [r5]
	adds r4, r3, #1
	ldrh r0, [r0]
	cmp r2, r0
	bge _08058208
	lsls r0, r3, #2
	mov r1, sp
	adds r3, r1, r0
	ldr r1, [r7]
_080581F8:
	ldr r0, [r3]
	adds r0, r0, r2
	strb r6, [r0]
	adds r2, #1
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r2, r0
	blt _080581F8
_08058208:
	adds r3, r4, #0
	ldr r0, [r5]
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _080581E4
_08058212:
	add sp, #0xa0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805821C: .4byte gUnknown_0816D938
_08058220: .4byte 0x0000417A

