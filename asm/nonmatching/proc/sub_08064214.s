	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08064214
sub_08064214: @ 0x08064214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x90
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r0, sp
	adds r1, r3, #0
	bl sub_08063FEC
	add r6, sp, #0x30
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_08064034
	add r4, sp, #0x60
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0806407C
	mov r0, sp
	adds r1, r6, #0
	adds r2, r6, #0
	bl sub_08063E28
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl sub_08063E28
	adds r7, r4, #0
	ldr r0, _08064284 @ =gUnknown_0202F140
	adds r4, r0, #0
	adds r4, #0xc
	adds r6, r0, #0
	movs r5, #7
_08064266:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_08063DDC
	adds r4, #0x18
	adds r6, #0x18
	subs r5, #1
	cmp r5, #0
	bge _08064266
	add sp, #0x90
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064284: .4byte gUnknown_0202F140

