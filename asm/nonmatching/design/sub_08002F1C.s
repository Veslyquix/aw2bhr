	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002F1C
sub_08002F1C: @ 0x08002F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r1, _08002FD8 @ =gUnknown_0808D728
	mov r0, sp
	movs r2, #0x28
	bl sub_0808B6E8
	movs r0, #0x13
	mov sb, r0
	movs r1, #0
	str r1, [sp, #0x28]
_08002F3A:
	movs r2, #0x4c
	mov r8, r2
	movs r6, #0
	mov r0, sb
	adds r0, #0x10
	mov r4, sb
	adds r4, #0x19
	str r4, [sp, #0x30]
	adds r1, #1
	str r1, [sp, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	lsls r0, r0, #0x10
	mov sl, r0
	ldr r2, [sp, #0x28]
	lsls r0, r2, #1
	mov r4, sp
	adds r7, r0, r4
_08002F60:
	ldrh r3, [r7]
	mov r4, r8
	adds r4, #0xa
	ldr r1, _08002FDC @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	adds r0, r3, #0
	str r3, [sp, #0x34]
	bl sub_0800C8A0
	adds r2, r0, #0
	adds r0, r4, #0
	mov r4, sl
	lsrs r1, r4, #0x10
	bl sub_0802BD54
	mov r4, r8
	adds r4, #2
	ldr r0, _08002FDC @ =0x000001FF
	ands r4, r0
	ldr r1, _08002FE0 @ =gUnknown_08485CC8
	adds r6, #1
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r3, [sp, #0x34]
	adds r0, r3, #0
	bl sub_08001D04
	adds r3, r0, #0
	lsls r3, r3, #0xc
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	adds r2, r5, #0
	bl sub_0801BD00
	movs r4, #0x14
	add r8, r4
	adds r7, #2
	ldr r0, [sp, #0x28]
	adds r0, #1
	str r0, [sp, #0x28]
	cmp r6, #3
	ble _08002F60
	ldr r1, [sp, #0x30]
	mov sb, r1
	ldr r1, [sp, #0x2c]
	cmp r1, #4
	ble _08002F3A
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FD8: .4byte gUnknown_0808D728
_08002FDC: .4byte 0x000001FF
_08002FE0: .4byte gUnknown_08485CC8

