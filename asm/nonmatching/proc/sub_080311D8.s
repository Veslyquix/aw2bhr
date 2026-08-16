	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080311D8
sub_080311D8: @ 0x080311D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7, #0x58]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	bl Interpolate
	mov sb, r0
	ldr r4, _08031274 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, _08031278 @ =0x0000188C
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7, #0x58]
	cmp r0, #0xf
	ble _0803127C
	adds r0, r7, #0
	bl Proc_Break
	b _08031280
	.align 2, 0
_08031274: .4byte gSinLut
_08031278: .4byte 0x0000188C
_0803127C:
	adds r0, #1
	str r0, [r7, #0x58]
_08031280:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

