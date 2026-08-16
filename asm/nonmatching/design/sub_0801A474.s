	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A474
sub_0801A474: @ 0x0801A474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0801A52C @ =gUnknown_0808E5C4
	ldr r0, [r0]
	ldr r2, [sp, #4]
	lsls r2, r2, #0x10
	mov sb, r2
	asrs r3, r2, #0x10
	lsls r2, r3, #1
	ldr r0, [r0]
	adds r0, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0xa
	adds r6, r0, r1
	ldr r0, [sp, #8]
	lsls r0, r0, #0x10
	mov r8, r0
	asrs r2, r0, #0x10
	adds r0, r6, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_0801A1D8
	adds r6, #0x40
	movs r5, #1
	movs r7, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #2
	cmp r7, r4
	bge _0801A4F8
	mov sl, r4
	mov r4, r8
_0801A4D0:
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	movs r0, #8
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sb
	asrs r1, r2, #0x10
	asrs r2, r4, #0x10
	bl sub_0801A240
	adds r6, #0x40
	movs r0, #1
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sl
	blt _0801A4D0
_0801A4F8:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #8]
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	movs r3, #8
	bl sub_0801A2E4
	ldr r0, _0801A530 @ =gUnknown_0849958C
	ldr r0, [r0]
	ldr r1, _0801A534 @ =0x0600E800
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_08011C68
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A52C: .4byte gUnknown_0808E5C4
_0801A530: .4byte gUnknown_0849958C
_0801A534: .4byte 0x0600E800

