	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B2F8
sub_0807B2F8: @ 0x0807B2F8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0807B354 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _0807B30E
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
_0807B30E:
	bl sub_080248E4
	adds r3, r0, #0
	ldr r1, [r7, #0x30]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _0807B358 @ =gUnknown_08499578
	ldr r2, [r4]
	movs r6, #0x80
	lsls r6, r6, #8
	str r6, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r0, #1
	bl sub_080149C0
	ldr r1, [r7, #0x30]
	adds r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, [r4]
	ldr r0, _0807B35C @ =gUnknown_03004080
	ldrh r3, [r0]
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	bl sub_08014B0C
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B354: .4byte gUnknown_03003FC0
_0807B358: .4byte gUnknown_08499578
_0807B35C: .4byte gUnknown_03004080

