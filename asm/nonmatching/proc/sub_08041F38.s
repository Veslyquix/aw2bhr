	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041F38
sub_08041F38: @ 0x08041F38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	movs r4, #0
	cmp r2, #0
	bne _08041F4C
	movs r0, #0
	b _08041FD2
_08041F4C:
	ldr r1, _08041FDC @ =gUnknown_08499594
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r5, r1, r0
	subs r0, r6, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r7, r1, #0x10
	ldrb r2, [r5]
	adds r1, r7, #0
	bl sub_08041EA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08041F76
	movs r4, #4
_08041F76:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r5]
	adds r1, r7, #0
	bl sub_08041EA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08041F90
	movs r0, #8
	orrs r4, r0
_08041F90:
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
	mov r1, r8
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r5]
	adds r0, r6, #0
	bl sub_08041EA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08041FB0
	movs r0, #1
	orrs r4, r0
_08041FB0:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r2, [r5]
	adds r0, r6, #0
	bl sub_08041EA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08041FD0
	movs r0, #2
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_08041FD0:
	adds r0, r4, #0
_08041FD2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041FDC: .4byte gUnknown_08499594

