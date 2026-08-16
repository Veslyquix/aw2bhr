	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069DE8
sub_08069DE8: @ 0x08069DE8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _08069E48 @ =gUnknown_08581108
	bl Proc_EndEach
	ldr r5, [r4, #0x38]
	cmp r5, #0
	bne _08069E50
	ldrh r1, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x50
	bl sub_08067ED0
	ldr r2, [r4, #0x3c]
	subs r2, #0x18
	movs r0, #0
	movs r1, #0x10
	adds r3, r4, #0
	bl sub_08068014
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	movs r2, #0xa0
	lsls r2, r2, #2
	str r4, [sp]
	movs r3, #3
	bl sub_080686E8
	movs r0, #0xe8
	strh r0, [r4, #0x2a]
	strh r5, [r4, #0x2e]
	strh r5, [r4, #0x2c]
	ldr r0, _08069E4C @ =0x0000FFC8
	strh r0, [r4, #0x30]
	movs r0, #1
	bl sub_08069D3C
	b _08069E9E
	.align 2, 0
_08069E48: .4byte gUnknown_08581108
_08069E4C: .4byte 0x0000FFC8
_08069E50:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4, #0x34]
	ldr r2, [r4, #0x3c]
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r2, #0xb4
	movs r3, #0xa0
	bl sub_08067ED0
	ldr r2, [r4, #0x3c]
	subs r2, #0x18
	movs r0, #0
	movs r1, #0x10
	adds r3, r4, #0
	bl sub_08068014
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	movs r2, #0xa0
	lsls r2, r2, #2
	str r4, [sp]
	movs r3, #3
	bl sub_080686E8
	movs r1, #0
	ldr r0, _08069EA8 @ =0x0000FFD0
	strh r0, [r4, #0x2a]
	strh r1, [r4, #0x2e]
	strh r1, [r4, #0x2c]
	movs r0, #0x98
	strh r0, [r4, #0x30]
	movs r0, #0
	bl sub_08069D3C
_08069E9E:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069EA8: .4byte 0x0000FFD0

