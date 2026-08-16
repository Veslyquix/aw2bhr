	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801642C
sub_0801642C: @ 0x0801642C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov sb, r1
	ldr r7, _080164D8 @ =gUnknown_03001470
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r6, r0, #5
	adds r0, r6, r7
	mov r8, r0
	movs r2, #0x38
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080164C0
	mov r5, sp
	adds r5, #2
	adds r0, r1, #0
	mov r1, sp
	adds r2, r5, #0
	bl sub_080155E8
	adds r4, r7, #0
	adds r4, #0x3c
	adds r4, r6, r4
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	bl __floatsisf
	str r0, [r4]
	adds r4, r7, #0
	adds r4, #0x40
	adds r4, r6, r4
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl __floatsisf
	str r0, [r4]
	adds r4, r7, #0
	adds r4, #0x4c
	adds r4, r6, r4
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r5, [r0]
	ldr r0, [r5]
	bl __floatsisf
	str r0, [r4]
	adds r0, r7, #0
	adds r0, #0x50
	adds r0, r6, r0
	ldr r1, _080164DC @ =0x00000000
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x54
	adds r0, r6, r0
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r6, r0
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x5c
	adds r0, r6, r0
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r2, r8
	ldrh r0, [r2, #0x38]
	adds r0, #1
	strh r0, [r2, #0x38]
_080164C0:
	mov r0, sb
	bl sub_080162A4
	movs r0, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080164D8: .4byte gUnknown_03001470
_080164DC: .4byte 0x00000000

