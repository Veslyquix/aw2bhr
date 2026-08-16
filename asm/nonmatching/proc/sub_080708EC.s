	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080708EC
sub_080708EC: @ 0x080708EC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _0807096C @ =gUnknown_03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _08070970 @ =gUnknown_081B9ED8
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _08070974 @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _08070978 @ =0x00001388
	adds r0, r0, r1
	ldr r1, _0807097C @ =0x00002710
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _08070980 @ =0x04000102
	strh r6, [r0]
	ldr r4, _08070984 @ =0x04000100
	ldr r0, _08070988 @ =0x00044940
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl sub_08070AF8
	ldr r1, _0807098C @ =0x04000006
_08070950:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _08070950
	ldr r1, _0807098C @ =0x04000006
_08070958:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _08070958
	ldr r1, _08070980 @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807096C: .4byte gUnknown_03007FF0
_08070970: .4byte gUnknown_081B9ED8
_08070974: .4byte 0x00091D1B
_08070978: .4byte 0x00001388
_0807097C: .4byte 0x00002710
_08070980: .4byte 0x04000102
_08070984: .4byte 0x04000100
_08070988: .4byte 0x00044940
_0807098C: .4byte 0x04000006

