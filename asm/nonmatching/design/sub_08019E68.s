	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019E68
sub_08019E68: @ 0x08019E68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	movs r0, #0x10
	mov sb, r0
	movs r1, #0
	mov r8, r1
	ldr r0, _08019E88 @ =gUnknown_0848A42C
	bl sub_080637AC
	adds r5, r0, #0
	movs r6, #0
	ldr r4, [r5, #0x20]
	b _08019EE4
	.align 2, 0
_08019E88: .4byte gUnknown_0848A42C
_08019E8C:
	ldr r0, [r4, #4]
	bl _call_via_r0
	adds r1, r5, #0
	adds r1, #0x24
	adds r1, r1, r6
	strb r0, [r1]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08019EDC
	adds r1, r7, #0
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	adds r0, #0x31
	adds r0, r0, r1
	strb r6, [r0]
	ldr r1, _08019F28 @ =gUnknown_08610A38
	ldrh r0, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08014D20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r8, r0
	bhs _08019ED2
	mov r8, r0
_08019ED2:
	mov r0, sb
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_08019EDC:
	adds r6, #1
	lsls r0, r6, #5
	ldr r1, [r5, #0x20]
	adds r4, r1, r0
_08019EE4:
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08019E8C
	adds r0, r5, #0
	adds r0, #0x40
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, r5, #0
	bl sub_08019C40
	adds r0, r5, #0
	adds r0, #0x48
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	mov r2, r8
	adds r2, #2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r4, sb
	lsrs r3, r4, #3
	bl sub_0801A444
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019F28: .4byte gUnknown_08610A38

