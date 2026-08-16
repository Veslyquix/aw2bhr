	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080162A4
sub_080162A4: @ 0x080162A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0801636C @ =gUnknown_03001470
	mov sl, r0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r7, r0, #5
	movs r1, #0x3c
	add r1, sl
	mov sb, r1
	add sb, r7
	mov r5, sl
	adds r5, #0x4c
	adds r5, r7, r5
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r5]
	bl __addsf3
	mov r1, sb
	str r0, [r1]
	movs r0, #0x40
	add r0, sl
	mov r8, r0
	add r8, r7
	mov r4, sl
	adds r4, #0x50
	adds r4, r7, r4
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r4]
	bl __addsf3
	mov r1, r8
	str r0, [r1]
	mov r1, sl
	adds r1, #0x54
	adds r1, r7, r1
	ldr r0, [r5]
	ldr r1, [r1]
	bl __addsf3
	str r0, [r5]
	mov r1, sl
	adds r1, #0x58
	adds r1, r7, r1
	ldr r0, [r4]
	ldr r1, [r1]
	bl __addsf3
	str r0, [r4]
	mov r1, sb
	ldr r0, [r1]
	bl __fixsfsi
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	ldr r0, [r1]
	bl __fixsfsi
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080155C0
	mov r1, sl
	adds r1, #0x5c
	adds r1, r7, r1
	ldr r0, [r1]
	adds r2, r0, #0
	subs r0, #1
	str r0, [r1]
	cmp r2, #0
	bne _0801635C
	mov r1, sl
	adds r0, r7, r1
	strh r2, [r0, #0x38]
	adds r1, #4
	adds r1, r7, r1
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
_0801635C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801636C: .4byte gUnknown_03001470

