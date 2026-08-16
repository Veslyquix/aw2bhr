	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063ABC
sub_08063ABC: @ 0x08063ABC
	push {r4, r5, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r4, _08063B3C @ =0x040000D4
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	cmp r0, #0
	bge _08063AD8
_08063AD0:
	ldr r0, [r4, #8]
	ands r0, r1
	cmp r0, #0
	bne _08063AD0
_08063AD8:
	ldr r1, _08063B40 @ =0x000003FF
	ands r3, r1
	lsls r3, r3, #5
	ldr r0, _08063B44 @ =0x06010000
	adds r3, r3, r0
	ands r2, r1
	lsls r2, r2, #5
	adds r2, r2, r0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08063B3C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _08063B48 @ =0x81000B00
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	adds r4, r0, #0
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	cmp r0, #0
	bge _08063B0E
_08063B06:
	ldr r0, [r4, #8]
	ands r0, r1
	cmp r0, #0
	bne _08063B06
_08063B0E:
	ldr r1, _08063B3C @ =0x040000D4
	ldr r5, _08063B4C @ =0x80000020
	movs r4, #0xa
_08063B14:
	adds r2, #0xa0
	str r3, [r1]
	str r2, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, #0x40
	adds r2, #0x80
	str r3, [r1]
	str r2, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r3, #0x40
	adds r2, #0xe0
	subs r4, #1
	cmp r4, #0
	bge _08063B14
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063B3C: .4byte 0x040000D4
_08063B40: .4byte 0x000003FF
_08063B44: .4byte 0x06010000
_08063B48: .4byte 0x81000B00
_08063B4C: .4byte 0x80000020

