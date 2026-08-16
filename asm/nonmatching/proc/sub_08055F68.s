	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08055F68
sub_08055F68: @ 0x08055F68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r1, _08055FC8 @ =gUnknown_0813615C
	ldr r3, [r1]
	lsls r2, r4, #4
	adds r0, r3, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov r8, r1
	ldr r6, _08055FCC @ =gUnknown_08136160
	cmp r0, #1
	bne _08055FEC
	ldr r0, [r6]
	mov ip, r0
	adds r7, r3, #2
	adds r0, r2, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _08055FEC
	movs r1, #1
	adds r0, r4, #0
	eors r0, r1
	lsls r1, r0, #4
	adds r0, r3, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #2
	beq _08055FC4
	adds r0, r1, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #2]
	cmp r0, #2
	bne _08055FD0
_08055FC4:
	movs r5, #0xc
	b _08055FD2
	.align 2, 0
_08055FC8: .4byte gUnknown_0813615C
_08055FCC: .4byte gUnknown_08136160
_08055FD0:
	movs r5, #4
_08055FD2:
	ldr r2, [r6]
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	b _0805600A
_08055FEC:
	ldr r3, [r6]
	mov r0, r8
	ldr r1, [r0]
	movs r2, #1
	adds r0, r4, #0
	eors r0, r2
	lsls r0, r0, #4
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #8]
_0805600A:
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

