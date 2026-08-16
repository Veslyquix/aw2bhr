	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004DD4
sub_08004DD4: @ 0x08004DD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r2, #0
	movs r5, #7
	cmp r0, #0
	bne _08004DE6
	movs r5, #5
_08004DE6:
	lsls r0, r1, #1
	adds r5, r5, r0
	ldr r0, _08004E34 @ =gUnknown_08499578
	mov r8, r0
	ldr r0, [r0]
	adds r4, r3, #3
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r2, r5, #0x10
	movs r3, #2
	str r3, [sp]
	movs r6, #0
	str r6, [sp, #4]
	movs r3, #9
	bl sub_08012BC8
	asrs r4, r4, #0x10
	asrs r5, r5, #0x10
	mov r1, r8
	ldr r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r3, r7, #0
	bl sub_080149C0
	bl sub_08013AEC
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004E34: .4byte gUnknown_08499578

