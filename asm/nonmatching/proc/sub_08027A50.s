	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027A50
sub_08027A50: @ 0x08027A50
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08027AFC @ =gUnknown_08499DE8
	ldr r2, _08027B00 @ =gUnknown_08499DDC
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl sub_08015438
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_08015638
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r0, _08027B04 @ =0xFFFF0FFF
	ands r0, r2
	movs r3, #0xc0
	lsls r3, r3, #6
	orrs r0, r3
	movs r3, #0xe5
	lsls r3, r3, #1
	adds r5, r5, r3
	ldr r3, _08027B08 @ =0x000003FF
	ands r5, r3
	ldr r3, _08027B0C @ =0xFFFFFC00
	ands r0, r3
	adds r2, r0, #0
	orrs r2, r5
	adds r0, r4, #0
	bl sub_08015608
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_080155C0
	adds r0, r4, #0
	bl sub_08016824
	adds r0, r4, #0
	bl sub_08016944
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157A4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080157F4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_080158D4
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027AFC: .4byte gUnknown_08499DE8
_08027B00: .4byte gUnknown_08499DDC
_08027B04: .4byte 0xFFFF0FFF
_08027B08: .4byte 0x000003FF
_08027B0C: .4byte 0xFFFFFC00

