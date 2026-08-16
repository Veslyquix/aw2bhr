	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014A5C
sub_08014A5C: @ 0x08014A5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x20]
	ldr r0, [sp, #0x24]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r0, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	ldr r2, _08014AE8 @ =gUnknown_03001470
	asrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r7, r1, r2
	ldr r0, _08014AEC @ =gUnknown_08610A38
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x24]
	mov r1, sb
	str r1, [r7, #0x28]
	strh r5, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	adds r0, #0x30
	strb r6, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
_08014AC4:
	adds r0, r7, #0
	bl sub_08013D4C
	adds r4, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_08014084
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08014AF0
	cmp r0, #1
	bgt _08014AC4
	cmp r0, #0
	beq _08014AFC
	b _08014AC4
	.align 2, 0
_08014AE8: .4byte gUnknown_03001470
_08014AEC: .4byte gUnknown_08610A38
_08014AF0:
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, sl
	bl sub_0801B998
	b _08014AC4
_08014AFC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

